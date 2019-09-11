# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/student_mailer/new_rank
  def new_rank
    StudentMailer.new_rank
  end

  # Preview this email at http://localhost:3000/rails/mailers/student_mailer/we_miss_you
  def we_miss_you
    StudentMailer.we_miss_you
  end

  # Preview this email at http://localhost:3000/rails/mailers/student_mailer/happy_birthday
  def happy_birthday
    StudentMailer.happy_birthday
  end

end
