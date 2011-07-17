require 'teststrap'

context 'RBSed - ' do
  setup { }
  
  context 'main' do
    asserts("Foobar".sed('s/o/p'   )) { "Fpobar" }
    asserts("Foobar".sed('s/O/p'   )) { "Foobar" }
    asserts("Foobar".sed('s/o/p/'  )) { "Fpobar" }
    asserts("Foobar".sed('s/O/p/'  )) { "Foobar" }
    asserts("Foobar".sed('s/O/p/i' )) { "Fpobar" }
    asserts("Foobar".sed('s/o/p/g' )) { "Fppbar" }
    asserts("Foobar".sed('s/O/p/ig')) { "Fppbar" }
    asserts("Foobar".sed('s/O/p/g' )) { "Foobar" }
  end

  context 'newlines' do
    asserts("Foobar\nFoobar".sed('s/o/p'   )) { "Fpobar\nFpobar" }
    asserts("Foobar\nFoobar".sed('s/O/p'   )) { "Foobar\nFoobar" }
    asserts("Foobar\nFoobar".sed('s/o/p/'  )) { "Fpobar\nFpobar" }
    asserts("Foobar\nFoobar".sed('s/O/p/'  )) { "Foobar\nFoobar" }
    asserts("Foobar\nFoobar".sed('s/O/p/i' )) { "Fpobar\nFpobar" }
    asserts("Foobar\nFoobar".sed('s/o/p/g' )) { "Fppbar\nFppbar" }
    asserts("Foobar\nFoobar".sed('s/O/p/ig')) { "Fppbar\nFppbar" }
    asserts("Foobar\nFoobar".sed('s/O/p/g' )) { "Foobar\nFoobar" }
  end

  context 'nondestructive' do
    x = "Foobar"
    x.sed('s/o/p')
    asserts(x) { "Foobar" }
  end

  context 'destructive' do
    x = "Foobar"
    x.sed!('s/o/p')
    asserts(x) { "Fpobar" }
  end
end
