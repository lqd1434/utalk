enum MyAction{
  change
}

class Ployd<T>{
  MyAction type;
  T data;

  Ployd(this.type, this.data);
}
