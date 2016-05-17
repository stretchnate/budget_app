# budget_app
a refactor of the budget app, to be built on laravel and optimized for mobile devices.

## Localhost Setup

1. Download homestead:
 1. `cd ~`
 1. `git clone https://github.com/laravel/homestead.git Homestead`
 1. `bash init.sh`

1. Create ssh keypair:
 1. `ssh-keygen -t rsa -C "your@email.com"`

1. Add budget.app to hosts:
 1. `vi /etc/hosts`
 1. Add line to hosts file: `127.0.0.1 budget.app`

1. Verify localhost app loads:
 1. http://budget.app:8000
