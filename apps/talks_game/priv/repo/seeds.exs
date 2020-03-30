alias TalksGame.Repo
alias TalksGame.User
alias TalksGame.Timer

Repo.insert!(%User{
  team_number: NULL,
  team_type: "admin",
  login: "admin",
  password:
    "$argon2id$v=19$m=65536,t=10,p=8$EObrUdwlXmJl+vrL5g43+A$AGna7Zx6/PbIVjRhmviI3lXuo/p0IEUSWJ2Sx+4eSPM"
})

Repo.insert!(%User{
  team_number: 1,
  team_type: "supplier",
  login: "supplier1",
  password:
    "$argon2id$v=19$m=65536,t=10,p=8$uMGy1regLkduJBjv6hHzPw$VfcE6iLYob/gjfOuljXHLIYUptFgQmRJZQiL3ZE4dkM"
})

Repo.insert!(%User{
  team_number: 2,
  team_type: "supplier",
  login: "supplier2",
  password:
    "$argon2id$v=19$m=65536,t=10,p=8$TrvXf1BiX0M047a2q+YwTg$W46VJ/gW5AsJuDlQh2BFINZJ/XX0NOtmuYQexWsAZos"
})

Repo.insert!(%User{
  team_number: 1,
  team_type: "consumer",
  login: "consumer1",
  password:
    "$argon2id$v=19$m=65536,t=10,p=8$j6bSuUFzVFPlI21MIdUvKw$/MYzNqtOIiUhuXYJN7Xxki3WJpqscoqWklDEOew9gNI"
})

Repo.insert!(%User{
  team_number: 2,
  team_type: "consumer",
  login: "consumer2",
  password:
    "$argon2id$v=19$m=65536,t=10,p=8$MavBd7sSgR/1H5NFkkkx+w$euqLCoOU3b7qF8Ojg83C5DG6ni0cdqvU/INkU6m1ew0"
})

Repo.insert!(%User{
  team_number: 2,
  team_type: "consumer",
  login: "consumer2",
  password: "foo"
})

# TIMERS
Repo.insert!(%Timer{
  period: 1,
  hour: 23,
  minute: 0
})

Repo.insert!(%Timer{
  period: 2,
  hour: 23,
  minute: 15
})

Repo.insert!(%Timer{
  period: 3,
  hour: 23,
  minute: 20
})

Repo.insert!(%Timer{
  period: 4,
  hour: 23,
  minute: 25
})

Repo.insert!(%Timer{
  period: 5,
  hour: 23,
  minute: 30
})
