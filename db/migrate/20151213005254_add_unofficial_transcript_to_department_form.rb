class AddUnofficialTranscriptToDepartmentForm < ActiveRecord::Migration
  def change
    add_attachment :department_forms, :unofficial_transcript
  end
end
