FactoryBot.define do
  factory(:task) do
    address { "Belo Horizonte - MG" }
    company_id { create(:company).id }
    employee_id { create(:employee).id }
    description { "teste alterado" }
    latitude { -19.9227318 }
    longitude { -43.9450948 }
    title { "Entregar a segunda parte" }
  end
end
