class Sorter
  attr_reader :students

  def initialize(students)
    @students = students
  end

  def get_student_list
    students.keys
  end

  def get_previous_pairs(student)
    students[student]
  end

  def output_day_pairs(students, day)
    all_pair_arrays[day-1]
  end

  def all_pair_arrays
    students = get_student_list
    pairs = generate_pair_arrays(students)
    pairs
  end

  def number_of_students
    students.size
  end

  def generate_pair_arrays(students)
    pivot_student = students.shift
    (1...number_of_students).map do
      students.rotate!
      [[pivot_student, students.first]] + (1...(number_of_students / 2)).map do |j|
         [students[j], students[number_of_students - 1 - j]]
      end
    end
  end

end
