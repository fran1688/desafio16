def show_add_students
  file = File.open('students.csv','r').readlines
  lines_stud = []
  file.each { |line| lines_stud.push(line.split(', ').map(&:chomp)) }

  lines_stud.each do |notes|
    name = notes.shift
    average = get_sum_pro(notes)
    File.open('estudiantes.txt', 'a'){ |file| file.puts "#{name} tiene un promedio #{average}" }
  end  
  puts "Se Genero el el archivo"
end

#takes the average of the students
def show_non_attendance
  non_attendance = File.open('students.csv', 'r').readlines
  non_attendance.map do |note|
    new_lines_stud = note.split(', ').map(&:chomp)

    name = new_lines_stud.shift
    assistance = new_lines_stud.select.count { |ele| ele == 'A' }
    
    puts "El Estudiante #{name} tuvo #{assistance} inasistencia." if assistance > 0
    
  end
end

def show_approved_students
  file = File.open('students.csv','r').readlines

puts "Agregue la nota minima de aprobación (coloque enter si la nota es 5) "
input = gets.chomp 

if input == ""      
  puts "La nota minima de aprobación es 5" 
else     
  puts "La nota minima de aprobación es " + input 
end

new_lines_stud = []
file.each { |line| new_lines_stud.push(line.split(', ').map(&:chomp)) }

new_lines_stud.each do |notes|
  name = notes.shift
  approved = get_sum_pro(notes) 

  if input == ""      
    puts "El Estudiante #{name} Aprobo con un promedio de #{approved}" if approved >= 5
  else     
    puts "El Estudiante #{name} Aprobo con un promedio de #{approved}" if approved >= input.to_f
  end

end
end

def get_sum_pro(notes)
  sum = 0
  notes.each do |ele|      
    unless ele == "A"
      sum += ele.to_f
    end
  end
  return sum / notes.length
end

puts 'Bienvenido al Sistema de Estudiantes!, seleccione su opción:'

option = 0

while option != 4
  puts
  puts '1. Generar archivo con los nombre de los estudiantes y el promedio de notas'
  puts '2. Cantidad de inasistencias de los Estudiantes'
  puts '3. Los nombres de los alumnos aprobados'
  puts '4. Salir'  

  option = gets.chomp.to_i

  case option
  when 1
    show_add_students
  when 2
    show_non_attendance
  when 3
    show_approved_students
  when 4
    puts 'Adios!'
  else
    puts ' La opción es inválida, elija una opcion correcta'
  end
end
