class VelocityField {
  //acceleration due to gravity, acceleration due to wind
  float dvg, vglimit, dvw, cellY, cellX;
  PVector[] u;
  //mass 
  
  //resolution
  int N, size;
  
  VelocityField(int _N) {
    N = _N;
    size = N*N;
    dvg = .01;
    final cellY = height/N;
    final cellX = width/N;
    vglimit = 5;
    for(int i=0;i<size;i++){    
      u[i] = new PVector(0, gravity(i));
    }
  }
  
  public PVector velocity(PVector pos){
    int Nx = (int)pos.x/cellX;
    int Ny = (int)pos.y/cellY;
    //find the cell and then look up its velocity in u[]
    
  }
  
  private float gravity(int i){
    row = floor(i/N)
    return float y = (row*dvg*cellY > vglimit) ? y=vglimit : y=i*dvg*dt;
  }
  
  
  
  
}
