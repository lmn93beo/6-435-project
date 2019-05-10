data {
  int N;
}

generated quantities {
  // Simulate v from prior model
  real v = normal_rng(-4.5, 0.1);
  
  
  // Simulate r and y
  real r[N];
  int y[N];
  
  r[1] = beta_rng(2, 2);
  y[1] = bernoulli_rng(r[1]);
  print(r[1]);
  
  print(v);
  for (n in 2:N) {
    r[n] = beta_rng(r[n - 1] * exp(-v), (1 - r[n - 1]) * exp(-v));
    y[n] = bernoulli_rng(r[n]);
  }  
}
