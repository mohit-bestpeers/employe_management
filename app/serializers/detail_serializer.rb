class DetailSerializer < ActiveModel::Serializer
  attributes :date_of_birth ,:father_name, :mother_name, :contact ,
   :emergency_contact , :present_address, :permanent_address , :date_of_joining ,:skills
end
