class StudentMailer < ApplicationMailer
  default from: "notify@lolconcepts.com"
  def new_rank(student)
  @student = student
  @dojo = Dojo.find(1)
  mail(:to => student.email, :subject => "Congratulations on your new #{@student.rank.color}")
  end

  # Send out a note to students, when they miss a certain amount of classes. Template:=> /views/user_mailer/we_miss_you.text.erb
  def we_miss_you(student)
  @attendance_records = Attendance.where(:student_id => student.id)
  @last_seen = @attendance_records.last.created_at.strftime("%A,%B %y")
  @dojo = Dojo.find(1)
  @student = student
  mail(:to => student.email, :subject => "#{@student.first_name}, We Miss You!")
  end
  
  # Send out a note to students, when it's their birthday. Template:=> /views/user_mailer/happy_birthday.text.erb
  def happy_birthday(student)
  @dojo = Dojo.find(1)
  @student = student
  mail(:to => student.email, :subject => "Happy Birthday, #{@student.first_name}!")
  end
  
  # Send out a note to ALL students. Template:=> /views/user_mailer/email_blast.text.erb
  def email_blast(subject,message)
    @students = Student.all.where(:sms_ok => true)
    @email_list = []
    @students.each do |s|
      email = s.smsAddress
      if email != ""
        @email_list << email
      end
    end
    @subj = subject
    mail(:bcc => @email_list, :subject => @subj, :body => message)
  end

end