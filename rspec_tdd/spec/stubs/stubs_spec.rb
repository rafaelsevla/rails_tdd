require 'student'
require 'course'

describe 'Stub' do 
  it '#has_finished?' do
    student = Student.new
    course = Course.new

    allow(student).to receive(:has_finished?)
      .with(an_instance_of(Course))
      .and_return(true)
    # allow(student).to receive(:has_finished?)
    #   .with(course).
    #   and_return(true)

    finished_course = student.has_finished?(course)
    expect(finished_course).to be true
  end

  it 'Dynamic Arguments' do
    student = Student.new

    allow(student).to receive(:foo) do |arg|
      if arg == :hello
        "olá"
      elsif arg == :hi
        "oi"
      end
    end

    expect(student.foo(:hello)).to eq("olá")
    expect(student.foo(:hi)).to eq("oi")
  end

  it "Any instance of a class" do
    student = Student.new
    another_student = Student.new

    allow_any_instance_of(Student).to receive(:bar).and_return('Palmeiras')

    expect(student.bar).to eq('Palmeiras')
    expect(another_student.bar).to eq('Palmeiras')
  end

  it "Mock Errors" do
    student = Student.new

    allow_any_instance_of(Student).to receive(:bar).and_raise(RuntimeError)

    expect { student.bar }.to raise_error(RuntimeError)
  end
end