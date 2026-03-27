tangleVariety = n -> (
    (v, r) := (symbol v, symbol r);
    R := QQ[v_(0,0)..v_(n-1,2),r];
    A := genericMatrix(R, 3, n);
    trim ideal join (
	apply(n, i -> (transpose A_{i} * A_{i})_(0,0) - r^2),
	apply(3, j -> sum(n, i -> v_(i,j))),
	apply(n, i -> (transpose A_{i} * A_{(i + 1) % n})_(0,0))))

affineTangleVariety = n -> (
    I := tangleVariety n;
    R := ring I;
    v := symbol v;
    S := QQ[v_(2,0)..v_(n-1,2)];
    phi := map(S, R, join(
	    {1, 0, 0, 0, 1, 0},
	    apply(3*n - 6, i -> S_i),
	    {1}));
    radical trim phi I)

needsPackage "NumericalAlgebraicGeometry"
needsPackage "JSON"

plotTangle = I -> (
    x := flatten entries  clean(1e-10, matrix first solveSystem I_*);
    n := #x // 3;
    toJSON join({{1, 0, 0}, {0, 1, 0}},
	apply(n, i -> {x#(3*i), x#(3*i + 1), x#(3*i + 2)})))

plotTangle (minimalPrimes affineTangleVariety 6)#1
plotTangle (minimalPrimes affineTangleVariety 6)#2

importFrom(Core, "rawFareyApproximation")

plotTangleFromAngle = theta -> (
    tangleCurve := first minimalPrimes affineTangleVariety 6;
    I := trim(tangleCurve + ideal((ring tangleCurve)_0 - rawFareyApproximation(cos theta, 10)));
    plotTangle I)

plotTangleFromAngle pi
plotTangleFromAngle (3*pi/4)
plotTangleFromAngle (pi/2)

debug Core

rawFareyApproximation

tangleCurve = first minimalPrimes affineTangleVariety 6;
theta = 3*pi/4
I = trim(tangleCurve + ideal((ring tangleCurve)_0 - rawFareyApproximation(cos theta, 10)))
solveSystem oo_*
tangleCurve = first 

rawFareyApproximation(3*pi/4, 10)
