class Field {
  PVector[] u, v;
  Source s;
  int N;
  
  Field(int _N) {
    N = _N
    for int (i=0;i<N;i++) {
      u[i] = s.gravity(i)
      v[i] = 0;;
    }
  }
  
  
}

