FactoryBot.define do
  factory(:user) do
    address { "São Paulo - SP" }
    email { "rodrigo@rtoledo.inf.br" }
    password { "aassdd" }
    password_confirmation { "aassdd" }
    latitude { -23.5506507 }
    longitude { -46.6333824 }
    name { "rodrigo antonio" }
  end
end
