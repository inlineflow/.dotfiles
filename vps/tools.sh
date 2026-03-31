curl -sS https://webi.sh/node | sh; \
source ~/.config/envman/PATH.env

curl -sS https://webi.sh/golang | sh; \
source ~/.config/envman/PATH.env

go install github.com/a-h/templ/cmd/templ@latest
go install github.com/pressly/goose/v3/cmd/goose@latest
go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
