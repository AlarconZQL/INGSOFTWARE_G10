# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or  find_or_create_by!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie. find_or_create_by!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character. find_or_create_by!(name: 'Luke', movie: movies.first)




puts "Inicio creacion de etiquetas"
etiqueta1=Label.find_or_create_by!(nombre:"Matematica")
etiqueta2=Label.find_or_create_by!(nombre:"Fisica")
etiqueta3=Label.find_or_create_by!(nombre:"Historia")
etiqueta4=Label.find_or_create_by!(nombre:"Biologia")
etiqueta5=Label.find_or_create_by!(nombre:"Geografia")
etiqueta6=Label.find_or_create_by!(nombre:"Geologia")
puts "Fin creacion de etiquetas. #{Label.count} etiquetas"

puts "Inicio creacion de niveles"
nivel1=Level.find_or_create_by!(nombre:"Iniciado",puntos:0)
nivel2=Level.find_or_create_by!(nombre:"Experimentado",puntos:100)
nivel3=Level.find_or_create_by!(nombre:"Moderador",puntos:1000)
puts "Fin creacion de niveles. #{Level.count} niveles"

puts "Inicio creacion de direcciones"
dire1=Direction.find_or_create_by!(calle:"9 de Julio", ciudad:"Buenos Aires")
dire2=Direction.find_or_create_by!(calle:"Calle 1", ciudad:"La Plata")
dire3=Direction.find_or_create_by!(calle:"Calle 50", ciudad:"La Plata")
dire0=Direction.find_or_create_by!(calle:"No tiene",ciudad: "No tiene")
puts "Fin creacion de direcciones. #{Direction.count} direcciones"

puts "Inicio creacion de facultad"
facu1=Faculty.find_or_create_by!(nombre:"Ingenieria", direction_id:dire3.id)
facu2=Faculty.find_or_create_by!(nombre:"Informatica", direction_id:dire2.id)
facu3=Faculty.find_or_create_by!(nombre:"Humanidades", direction_id:dire1.id)
facu0=Faculty.find_or_create_by!(nombre:"Ninguna", direction_id:dire0.id)
puts "Fin creacion de facultades. #{Faculty.count} facultades"

puts "Inicio creacion de usuarios"
usuario1=User.find_or_create_by!(nombre:"Juan", apellido:"Perez", mail:"jp@hotmail.com", puntos:0, pass:"123456", faculty_id:facu2.id, level_id:nivel1.id)
usuario2=User.find_or_create_by!(nombre:"Maria", apellido:"Gomez", mail:"mg@hotmail.com", puntos:0, pass:"123456", faculty_id:facu1.id, level_id:nivel3.id)
usuario3=User.find_or_create_by!(nombre:"Pablo", apellido:"Neruda", mail:"pn@hotmail.com", puntos:0, pass:"123456", faculty_id:facu0.id, level_id:nivel2.id)
puts "Fin creacion de usuarios. #{User.count} usuarios"

puts "Inicio creacion de preguntas"
pregunta1=Question.find_or_create_by!(num_visitas:15, contenido:"¿Que es la Fotosintesis?", user_id: usuario1.id, faculty_id: facu2.id)
pregunta2=Question.find_or_create_by!(num_visitas:1, contenido:"¿Cual es la montaña mas alta del mundo?", user_id: usuario2.id, faculty_id: facu1.id)
pregunta3=Question.find_or_create_by!(num_visitas:25, contenido:"¿Que es un Eclipse?", user_id: usuario2.id, faculty_id: facu1.id)
pregunta4=Question.find_or_create_by!(num_visitas:5, contenido:"¿Cuando fue la Revolucion Rusa?", user_id: usuario1.id, faculty_id: facu2.id)
puts "Fin creacion de preguntas. #{Question.count} preguntas"

puts "Inicio creacion de tabla de relaciones"
QuestionLabel.find_or_create_by!(question_id:pregunta1.id, label_id:etiqueta1.id)
QuestionLabel.find_or_create_by!(question_id:pregunta1.id, label_id:etiqueta2.id)
QuestionLabel.find_or_create_by!(question_id:pregunta1.id, label_id:etiqueta3.id)
QuestionLabel.find_or_create_by!(question_id:pregunta2.id, label_id:etiqueta4.id)
QuestionLabel.find_or_create_by!(question_id:pregunta2.id, label_id:etiqueta5.id)
QuestionLabel.find_or_create_by!(question_id:pregunta2.id, label_id:etiqueta6.id)
puts "Fin creacion de tabla de relaciones. #{QuestionLabel.count} relaciones etiqueta-pregunta"


puts "Inicio creacion de comentario pregunta"
preguntacoment1=QuestionComment.find_or_create_by!(question_id:pregunta1.id, contenido:"Se poco, me interesaria saber una mejor respuesta", user_id: usuario2.id)
preguntacoment2=QuestionComment.find_or_create_by!(question_id:pregunta4.id,contenido:"¿Nadie contesta?", user_id: usuario2.id)
puts "Fin creacion de comentario pregunta. #{QuestionComment.count} comentario respuesta"



puts "Inicio creacion de respuestas"
respuesta1=Answer.find_or_create_by!(contenido:"Es lo que hacen las plantas", question_id:pregunta1.id, user_id: usuario2.id)
respuesta2=Answer.find_or_create_by!(question_id:pregunta1.id, contenido:"Es la conversión de materia inorgánica en materia orgánica gracias a la energía que aporta la luz", user_id: usuario3.id)
respuesta3=Answer.find_or_create_by!(question_id:pregunta2.id, contenido:"Monte Everest", user_id: usuario1.id)
respuesta4=Answer.find_or_create_by!(question_id:pregunta2.id, contenido:"El Monte Everest es la mas alta con 8.848", user_id: usuario3.id)
respuesta5=Answer.find_or_create_by!(question_id:pregunta3.id, contenido:"Es un fenómeno en el que la luz procedente de un cuerpo celeste es bloqueada por otro", user_id: usuario3.id)
puts "Fin creacion de respuestas. #{Answer.count} respuestas"

puts "Inicio creacion de comentario respuesta"
respuestacoment1=AnswerComment.find_or_create_by!(answer_id:respuesta4.id, contenido:"Muy buena la exactitud, gracias", user_id: usuario2.id)
respuestacoment2=AnswerComment.find_or_create_by!(answer_id:respuesta1.id,contenido:"¿Un poco mas detallado puede ser?", user_id: usuario1.id)
puts "Fin creacion de comentario respuesta. #{AnswerComment.count} comentario respuesta"



puts "Inicio asignacion de votos a preguntas"
QuestionVote.find_or_create_by!(tipo:true, user_id:usuario1.id, question_id:pregunta2.id)
QuestionVote.find_or_create_by!(tipo:false, user_id:usuario1.id, question_id:pregunta3.id)
QuestionVote.find_or_create_by!(tipo:true, user_id:usuario2.id, question_id:pregunta1.id)
QuestionVote.find_or_create_by!(tipo:true, user_id:usuario2.id, question_id:pregunta4.id)
QuestionVote.find_or_create_by!(tipo:false, user_id:usuario3.id, question_id:pregunta1.id)
QuestionVote.find_or_create_by!(tipo:false, user_id:usuario3.id, question_id:pregunta2.id)
QuestionVote.find_or_create_by!(tipo:false, user_id:usuario3.id, question_id:pregunta3.id)
QuestionVote.find_or_create_by!(tipo:false, user_id:usuario3.id, question_id:pregunta4.id)
puts "Fin asignacion de votos a preguntas. #{QuestionVote.count} votos de preguntas"


puts "Inicio asignacion de votos a respuestas"
AnswerVote.find_or_create_by!(tipo:false, user_id:usuario1.id, answer_id:respuesta2.id)
AnswerVote.find_or_create_by!(tipo:true, user_id:usuario1.id, answer_id:respuesta4.id)
AnswerVote.find_or_create_by!(tipo:true, user_id:usuario2.id, answer_id:respuesta4.id)
AnswerVote.find_or_create_by!(tipo:true, user_id:usuario3.id, answer_id:respuesta1.id)
puts "Fin asignacion de votos a respuestas. #{AnswerVote.count} votos de respuestas"

puts "Inicio asignacion de votos a comentarios de preguntas"
QuestionCommentVote.find_or_create_by!(tipo:false, user_id:usuario1.id, question_comment_id:preguntacoment1.id)
QuestionCommentVote.find_or_create_by!(tipo:true, user_id:usuario3.id, question_comment_id:preguntacoment2.id)
puts "Fin asignacion de votos a comentarios de preguntas. #{QuestionCommentVote.count} votos de comentarios de preguntas"


puts "Inicio asignacion de votos a comentarios de respuestas"
AnswerCommentVote.find_or_create_by!(tipo:false, user_id:usuario1.id, answer_comment_id:respuestacoment1.id)
AnswerCommentVote.find_or_create_by!(tipo:true, user_id:usuario3.id, answer_comment_id:respuestacoment2.id)
puts "Fin asignacion de votos a comentarios de respuestas. #{AnswerCommentVote.count} votos de comentarios de respuestas"


