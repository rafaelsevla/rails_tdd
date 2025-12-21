require 'student'

describe 'Mocks' do
  it "#bar" do
    # setup
    student = Student.new
    # verify
    expect(student).to receive(:bar)
    # exercise
    student.bar
  end

  it "args" do
    student = Student.new
    expect(student).to receive(:foo).with(42)

    student.foo(42)
  end

  it "repetition" do
    student = Student.new
    expect(student).to receive(:foo).with(42).twice

    student.foo(42)
    student.foo(42)
  end

  it "with return" do
    student = Student.new
    expect(student).to receive(:foo).with(42).and_return("bar")
    # return value is fake
    # its a form of stubbing method

    student.foo(42)
    student.foo(42)
  end
end