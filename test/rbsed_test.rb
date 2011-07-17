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
end
