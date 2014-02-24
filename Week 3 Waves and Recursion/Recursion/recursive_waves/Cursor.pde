// Manage recursion

class Cursor {  
  ArrayList<Wave>waves = new ArrayList<Wave>();
  float t, f, a, o;
  float of, oa;
  Cursor freq;
  Cursor amp;

  Cursor(float _t, float _f, float _a, float _o) {
    t = _t;
    f = _f;
    a = _a;
    o = _o;

    of = f;
    oa = a;

    waves.add(new Sine(t, f, a, o));
    waves.add(new Cosine(t, f, a, o));
    waves.add(new Square(t, f, a, o));
    waves.add(new Sawtooth(t, f, a, o));
    waves.add(new Tan(t, f, a, o));
  }

  void reset() {
    f = of; 
    a = oa;
    freq = new Cursor(t, f, a, o);
    amp = new Cursor(t, f, a, o);
  }

  float run(int count) {

    if (count >= limit) {
      return waves.get(indices[count]).run(f, a);
    }
    else {
      if (freq == null) {
        freq = new Cursor(t, f, a, o);
      }
      if (amp == null) {
        amp = new Cursor(t, f, a, o);
      }

      f = freq.run(count+1)/a*TWO_PI;
      a = amp.run(count+1);

      return waves.get(indices[count]).run(f, a);
    }
  }
}

