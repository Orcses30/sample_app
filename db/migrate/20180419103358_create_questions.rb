class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text    :question
      t.text    :answer
      t.integer :cfp_class

      t.timestamps
    end
  end
end
