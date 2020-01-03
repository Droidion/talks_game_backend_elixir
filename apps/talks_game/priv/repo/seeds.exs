alias TalksGame.Repo
alias TalksGame.User

Repo.insert! %User{
  team_number: 1,
  team_type: "supplier",
  login: "supplier1",
  password: "$argon2i$v=19$m=65536,t=10,p=1$oqNVkvb6yPPzFEPiC8MsJQ$tYbdOoDWT/NIffnhB6isk1GsFUKAkUKzTczfMhiG1bA"
}

Repo.insert! %User{
  team_number: 2,
  team_type: "supplier",
  login: "supplier2",
  password: "$argon2i$v=19$m=65536,t=10,p=1$wt2IG6dWb3lpDdoZV6lD6w$0xa45YpW+Mc7VmesrBAduns/L86jnc+vupBHUImIgUM"
}

Repo.insert! %User{
  team_number: 1,
  team_type: "consumer",
  login: "consumer1",
  password: "$argon2i$v=19$m=65536,t=10,p=1$4t/y8PJcBNu063UC5tEIcg$H6tpxXI3+nIFxcZ5z/kQahxFbzdT8VxVWwTiLmdjcE4"
}

Repo.insert! %User{
  team_number: 2,
  team_type: "consumer",
  login: "consumer2",
  password: "$argon2i$v=19$m=65536,t=10,p=1$5Y68/GY191Oeefm2lx+j6g$wiJ3ulyIXCVX/oc7nfqAqT+lND6eGJ3DwMBTmbH2zOQ"
}

Repo.insert! %User{
  team_number: 2,
  team_type: "consumer",
  login: "consumer2",
  password: "foo"
}
