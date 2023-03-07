.data
base: .double 5.85
altura: .double 13.47
superficie: .double 0.0
dos: .double 2.0
.code
l.d f1, base(r0)
l.d f2, altura(r0)
mul.d f3, f1, f2
l.d f4, dos(r0)
div.d f3, f3, f4
s.d f3, superficie(r0)
halt