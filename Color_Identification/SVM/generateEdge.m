function edge = generateEdge(center, range, interval)
edge = center - range + interval/2: interval : center + range - interval/2;
edge = edge(edge >= 0);
edge = edge(edge <= 255);

