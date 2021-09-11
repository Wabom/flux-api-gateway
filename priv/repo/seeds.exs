alias FluxApiGateway.{Repo, Route, Role, RoleRoute}

Route.changeset(%{name: "validation", request_path: "/user/validtoken", path: "/user/validtoken"})
|> Repo.insert()

Route.changeset(%{name: "auth", request_path: "/auth", path: "/auth"})
|> Repo.insert()

Route.changeset(%{name: "front", request_path: "/", path: "/"})
|> Repo.insert()

Route.changeset(%{name: "front2", request_path: "", path: "/"})
|> Repo.insert()

Role.changeset(%{name: "all"})
|> Repo.insert()

Role.changeset(%{name: "free"})
|> Repo.insert()

RoleRoute.changeset(%{route_id: 1, role_id: 2})
|> Repo.insert()

RoleRoute.changeset(%{route_id: 2, role_id: 2})
|> Repo.insert()

RoleRoute.changeset(%{route_id: 3, role_id: 1})
|> Repo.insert()

RoleRoute.changeset(%{route_id: 4, role_id: 1})
|> Repo.insert()
