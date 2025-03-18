<?php
class PersonData {
	public static $tablename = "person";

	public function __construct(){
		$this->name = "";
		$this->lastname = "";
		$this->ruc = "";
		$this->address = "";
		$this->phone = "";
		$this->email = "";
		$this->kind = "";
		$this->created_at = "(date_sub(NOW(),interval 5 hour))";
	}

	public function add_client(){
		$sql = "insert into person (name,lastname,ruc,address,email,phone,kind,created_at) ";
		$sql .= "value (\"$this->name\",\"$this->lastname\",\"$this->ruc\",\"$this->address\",\"$this->email\",\"$this->phone\",1,$this->created_at)";
		Executor::doit($sql);
	}

	public function add_provider(){
		$sql = "insert into person (name,lastname,ruc,address,email,phone,kind,created_at) ";
		$sql .= "value (\"$this->name\",\"$this->lastname\",\"$this->ruc\",\"$this->address\",\"$this->email\",\"$this->phone\",2,$this->created_at)";
		Executor::doit($sql);
	}

	public static function delById($id){
		$sql = "delete from ".self::$tablename." where id=$id";
		Executor::doit($sql);
	}
	public function del(){
		$sql = "delete from ".self::$tablename." where id=$this->id";
		Executor::doit($sql);
	}

	// partiendo de que ya tenemos creado un objecto PersonData previamente utilizamos el contexto

	public function update(){
		$sql = "update ".self::$tablename." set name=\"$this->name\",lastname=\"$this->lastname\",ruc=\"$this->ruc\",address=\"$this->address\",phone=\"$this->phone\",email=\"$this->email\" where id=$this->id";
		Executor::doit($sql);
	}

	public function update_passwd(){
		$sql = "update ".self::$tablename." set password=\"$this->password\" where id=$this->id";
		Executor::doit($sql);
	}

	public static function getById($id){
		$sql = "select * from ".self::$tablename." where id=$id";
		$query = Executor::doit($sql);
		$found = null;
		$data = new PersonData();
		while($r = $query[0]->fetch_array()){
			$data->id = $r['id'];
			$data->name = $r['name'];
			$data->lastname = $r['lastname'];
			$data->ruc = $r['ruc'];
			$data->address = $r['address'];
			$data->phone = $r['phone'];
			$data->email = $r['email'];
			$data->kind = $r['kind'];
			$data->created_at = $r['created_at'];
			$found = $data;
			break;
		}
		return $found;
	}

	public static function getAll(){
		$sql = "select * from ".self::$tablename;
		$query = Executor::doit($sql);
		$array = array();
		$cnt = 0;
		while($r = $query[0]->fetch_array()){
			$array[$cnt] = new PersonData();
			$array[$cnt]->id = $r['id'];
			$array[$cnt]->name = $r['name'];
			$array[$cnt]->lastname = $r['lastname'];
			$array[$cnt]->ruc = $r['ruc'];
			$array[$cnt]->address = $r['address'];
			$array[$cnt]->phone = $r['phone'];
			$array[$cnt]->email = $r['email'];
			$array[$cnt]->kind = $r['kind'];
			$array[$cnt]->created_at = $r['created_at'];
			$cnt++;
		}
		return $array;
	}

	public static function getClients(){
		$sql = "select * from ".self::$tablename." where kind=1 order by name,lastname";
		$query = Executor::doit($sql);
		$array = array();
		$cnt = 0;
		while($r = $query[0]->fetch_array()){
			$array[$cnt] = new PersonData();
			$array[$cnt]->id = $r['id'];
			$array[$cnt]->name = $r['name'];
			$array[$cnt]->lastname = $r['lastname'];
			$array[$cnt]->ruc = $r['ruc'];
			$array[$cnt]->address = $r['address'];
			$array[$cnt]->phone = $r['phone'];
			$array[$cnt]->email = $r['email'];
			$array[$cnt]->kind = $r['kind'];
			$array[$cnt]->created_at = $r['created_at'];
			$cnt++;
		}
		return $array;
	}

	public static function getClientsByCreditId(){
		$sql = "select * from ".self::$tablename." where kind=1 and credit=1 order by name,lastname";
		$query = Executor::doit($sql);
		$array = array();
		$cnt = 0;
		while($r = $query[0]->fetch_array()){
			$array[$cnt] = new PersonData();
			$array[$cnt]->id = $r['id'];
			$array[$cnt]->name = $r['name'];
			$array[$cnt]->lastname = $r['lastname'];
			$array[$cnt]->ruc = $r['ruc'];
			$array[$cnt]->address = $r['address'];
			$array[$cnt]->phone = $r['phone'];
			$array[$cnt]->email = $r['email'];
			$array[$cnt]->kind = $r['kind'];
			$array[$cnt]->created_at = $r['created_at'];
			$cnt++;
		}
		return $array;
	}


	public static function getProviders(){
		$sql = "select * from ".self::$tablename." where kind=2 order by name,lastname";
		$query = Executor::doit($sql);
		$array = array();
		$cnt = 0;
		while($r = $query[0]->fetch_array()){
			$array[$cnt] = new PersonData();
			$array[$cnt]->id = $r['id'];
			$array[$cnt]->name = $r['name'];
			$array[$cnt]->lastname = $r['lastname'];
			$array[$cnt]->ruc = $r['ruc'];
			$array[$cnt]->address = $r['address'];
			$array[$cnt]->phone = $r['phone'];
			$array[$cnt]->email = $r['email'];
			$array[$cnt]->kind = $r['kind'];
			$array[$cnt]->created_at = $r['created_at'];
			$cnt++;
		}
		return $array;
	}

	public static function getLike($q){
		$sql = "select * from ".self::$tablename." where name like '%$q%'";
		$query = Executor::doit($sql);
		$array = array();
		$cnt = 0;
		while($r = $query[0]->fetch_array()){
			$array[$cnt] = new PersonData();
			$array[$cnt]->id = $r['id'];
			$array[$cnt]->name = $r['name'];
			$array[$cnt]->lastname = $r['lastname'];
			$array[$cnt]->ruc = $r['ruc'];
			$array[$cnt]->address = $r['address'];
			$array[$cnt]->phone = $r['phone'];
			$array[$cnt]->email = $r['email'];
			$array[$cnt]->kind = $r['kind'];
			$array[$cnt]->created_at = $r['created_at'];
			$cnt++;
		}
		return $array;
	}


}

?>