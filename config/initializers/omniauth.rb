Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '965297906900288', 'fbd092ba1e3743698abe8c4c6c1fa835'
  provider :github, '71870e3581c62f5520d9', '69d932c6a8df9d675e5b7e684dad25b8fbdc64f2'
  provider :twitter, 'EZIQ0setbhhl7gBiQB6oRgu2e', 'AWxYrqosJv3tjcLja4p6DmMNRtoQEXRnpMx87gAOsybaQcMcgS'
end
