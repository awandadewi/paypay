class AddKwIntegratedToCompanies < ActiveRecord::Migration[5.0]
  def change

    change_table :companies do |t|
      t.boolean :kw_integrated, null: false, default: false
    end

  end
end
