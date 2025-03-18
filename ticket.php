<?php
include "core/controller/Core.php";
include "core/controller/Database.php";
include "core/controller/Executor.php";
include "core/controller/Model.php";

include "core/app/model/UserData.php";
include "core/app/model/SellData.php";
include "core/app/model/PersonData.php";
include "core/app/model/OperationData.php";
include "core/app/model/ProductData.php";
include "core/app/model/StockData.php";
include "core/app/model/ConfigurationData.php";
include "fpdf/fpdf.php";
session_start();
if(isset($_SESSION["user_id"])){ Core::$user = UserData::getById($_SESSION["user_id"]); }
$title = ConfigurationData::getByPreffix("ticket_title")->val;
$imp_name = ConfigurationData::getByPreffix("imp-name")->val;
$imp_val = ConfigurationData::getByPreffix("imp-val")->val;
$currency = ConfigurationData::getByPreffix("currency")->val;

$stock = StockData::getPrincipal();
$sell = SellData::getById($_GET["id"]);
$operations = OperationData::getAllProductsBySellId($_GET["id"]);
$user = $sell->getUser();
$client = $sell->getPerson();

$total = $sell->total+$sell->discount;
$disc = $sell->discount;
$subt = $total-$disc;
$igv = $subt*($imp_val/100);
$total_igv = $subt+$igv;

$pdf = new FPDF($orientation='P',$unit='mm', array(80,300));
$pdf->AddPage();
$pdf->SetFont('Arial','B',15);    //Letra Arial, negrita (Bold), tam. 20
//$pdf->setXY(5,0);
$pdf->setY(5);
$pdf->setX(2);
$pdf->MultiCell(76,5,strtoupper(utf8_decode($title)),0,'C');
$pdf->SetFont('Arial','B',8);    //Letra Arial, negrita (Bold), tam. 20
$pdf->setX(2);
$pdf->MultiCell(76,5,"DIR: ".strtoupper(utf8_decode($stock->address)),0,'C');
//$pdf->Ln(5);
$pdf->setX(2);
$pdf->Cell(76,5,"TEL: ".strtoupper($stock->phone),0,0,'C');
$pdf->Ln(5);
$pdf->setX(2);
$pdf->Cell(8,5,"TICKET: ".$sell->id);
$pdf->Ln(5);
$pdf->setX(2);
$pdf->Cell(8,5,"FECHA: ".$sell->created_at);
$pdf->Ln(5);
$pdf->setX(2);
$pdf->Cell(8,5,"CLIENTE: ".strtoupper(utf8_decode($client->name." ".$client->lastname)));
$pdf->Ln(5);
$pdf->setX(2);
$pdf->Cell(8,5,"RUC: ".strtoupper($client->ruc));
$pdf->Ln(5);
$pdf->setX(2);
$pdf->Cell(8,5,'------------------------------------------------------------------------------');
$pdf->Ln(5);
$pdf->setX(2);
$pdf->Cell(8,5,'CA.  ARTICULO       		         PRECIO           TOTAL');

$total =0;
$off = 15;
foreach($operations as $op){
$product = $op->getProduct();
$pdf->setX(2);
$pdf->Cell(5,$off,"$op->q");
$pdf->setX(8);
$pdf->Cell(35,$off,  strtoupper(substr(utf8_decode($product->modelo), 0,12)));
$pdf->setX(20);
$pdf->Cell(29,$off,  $currency.' '.number_format($product->price_out,2,".",",") ,0,0,"R");
$pdf->setX(32);
$pdf->Cell(35,$off,  $currency.' '.number_format($op->q*$product->price_out,2,".",",") ,0,0,"R");

//    ".."  ".number_format($op->q*$product->price_out,2,".",","));
$total += $op->q*$product->price_out;
$off+=6;
}
$stotal = $total-$sell->discount;
$pdf->setX(2);
$pdf->Cell(5,$off+3,"TOTAL: " );
$pdf->setX(62);
$pdf->Cell(5,$off+3,$currency.' '.number_format($total,2,".",","),0,0,"R");
$pdf->setX(2);
$pdf->Cell(5,$off+9,"DESCUENTO: " );
$pdf->setX(62);
$pdf->Cell(5,$off+9,$currency.' '.number_format($sell->discount,2,".",","),0,0,"R");
$pdf->setX(2);
$pdf->Cell(5,$off+15,"SUBTOTAL:  " );
$pdf->setX(62);
$pdf->Cell(5,$off+15,$currency.' '.number_format($subt,2,".",","),0,0,"R");
$pdf->setX(2);
$pdf->Cell(5,$off+21,$imp_name.' ('.$imp_val.'%):  ');
$pdf->setX(62);
$pdf->Cell(5,$off+21,$currency.' '.number_format($igv,2,".",","),0,0,"R");
$pdf->setX(2);
$pdf->Cell(5,$off+27,"TOTAL A PAGAR: " );
$pdf->setX(62);
$pdf->Cell(5,$off+27,$currency.' '.number_format($total_igv,2,".",","),0,0,"R");

$pdf->setX(2);
$pdf->Cell(5,$off+33,'------------------------------------------------------------------------------');
$pdf->setX(2);
$pdf->Cell(5,$off+39,"EFECTIVO: " );
$pdf->setX(62);
$pdf->Cell(5,$off+39,$currency.' '.number_format($sell->cash,2,".",","),0,0,"R");

$pdf->setX(2);
$pdf->Cell(5,$off+45,"VUELTO: " );
$pdf->setX(62);
$pdf->Cell(5,$off+45,$currency.' '.number_format($sell->cash-$stotal,2,".",","),0,0,"R");

$pdf->setX(2);
$pdf->Cell(5,$off+51,'------------------------------------------------------------------------------');
$pdf->setX(2);
$pdf->Cell(5,$off+57,"SUCURSAL: ".strtoupper(utf8_decode($stock->name)));
$pdf->setX(2);
$pdf->Cell(5,$off+63,'VENDEDOR: '.strtoupper(utf8_decode($user->name." ".$user->lastname)));
$pdf->setX(10);
$pdf->Cell(5,$off+69,"GRACIAS POR SU COMPRA");
$pdf->setX(2);

$pdf->output();
