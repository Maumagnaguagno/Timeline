#frozen_string_literal: true
require 'test/unit'

class Deadline < Test::Unit::TestCase

  def test_timeline_dot_generation
    output_filename = 'README.md.dot'
    File.delete(output_filename) if File.exist?(output_filename)
    system('ruby timeline.rb')
    assert_equal(File.binread('tests/README.md.dot'), File.binread(output_filename))
  ensure
    File.delete(output_filename) if File.exist?(output_filename)
  end

  def test_timeline_dot_generation_with_dir
    output_filename = 'README.md.dot'
    ['TB','BT','LR','RL'].each {|dir|
      File.delete(output_filename) if File.exist?(output_filename)
      system("ruby timeline.rb README.md #{dir}")
      assert_equal(File.binread('tests/README.md.dot').sub!('LR', dir), File.binread(output_filename))
    }
  ensure
    File.delete(output_filename) if File.exist?(output_filename)
  end

  def test_timeline_dot_generation_with_pdf
    output_dot_filename = 'README.md.dot'
    output_pdf_filename = 'README.md.dot.pdf'
    File.delete(output_dot_filename) if File.exist?(output_dot_filename)
    File.delete(output_pdf_filename) if File.exist?(output_pdf_filename)
    system('ruby timeline.rb README.md LR pdf')
    assert_true(File.exist?(output_dot_filename))
    assert_true(File.exist?(output_pdf_filename))
  ensure
    File.delete(output_dot_filename) if File.exist?(output_dot_filename)
    File.delete(output_pdf_filename) if File.exist?(output_pdf_filename)
  end
end