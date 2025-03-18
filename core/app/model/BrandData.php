<?php
	class BrandData {
		public static $tablename = "brand";
		
		public function __construct(){		
			$this->name = "";
		}

		public function add(){
			$sql = "insert into brand (name)";
			$sql .= "value (\"$this->name\")";
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

		// partiendo de que ya tenemos creado un objecto BrandData previamente utilizamos el contexto

		public function update(){
			$sql = "update ".self::$tablename." set name=\"$this->name\" where id=$this->id";
			Executor::doit($sql);
		}

		public static function getById($id){
			$sql = "select * from ".self::$tablename." where id=$id";
			$query = Executor::doit($sql);
			$found = null;
			$data = new BrandData();
			while($r = $query[0]->fetch_array()){
				$data->id = $r['id'];
				$data->name = $r['name'];
				$found = $data;
				break;
			}
			return $found;
		}

		public static function getAllByPrspId($id){
			$sql = "select * from ".self::$tablename." where id=$id order by id desc"; 
			$query = Executor::doit($sql);
			$array = array();
			$cnt = 0;
			while($r = $query[0]->fetch_array()){
				$array[$cnt] = new BrandData();
				$array[$cnt]->id = $r['id'];
				$array[$cnt]->name = $r['name'];
				$cnt++;
			}
			return $array;
		}

		public static function getAllByPrdId($id){
			$sql = "select * from ".self::$tablename." where name=$id order by id desc"; 
			$query = Executor::doit($sql);
			$array = array();
			$cnt = 0;
			while($r = $query[0]->fetch_array()){
				$array[$cnt] = new BrandData();
				$array[$cnt]->id = $r['id'];
				$array[$cnt]->name = $r['name'];
				$cnt++;
			}
			return $array;
		}

		public static function getAll(){
			$sql = "select * from ".self::$tablename." order by name asc";
			$query = Executor::doit($sql);
			return Model::many($query[0],new BrandData());
		}


		public static function getLike($q){
			$sql = "select * from ".self::$tablename." where name like '%$q%' or model like '%$q%' or description like '%$q%'";
			$query = Executor::doit($sql);
			return Model::many($query[0],new BrandData());
		}

		public static function getAllByListIdAll($id){
			$sql = "select * from ".self::$tablename." where user_id=$id";
			$query = Executor::doit($sql);
			$array = array();
			$cnt = 0;
			while($r = $query[0]->fetch_array()){
				$array[$cnt] = new BrandData();
				$array[$cnt]->id = $r['id'];
				$array[$cnt]->name = $r['name'];
				$cnt++;
			}
			return $array;
		}

		public static function getRes(){
			$sql = "select * from ".self::$tablename." where user_id=1 order by created_at desc";
			$query = Executor::doit($sql);
			return Model::many($query[0],new BrandData());
		}
	}

?>