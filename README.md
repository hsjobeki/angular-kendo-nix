[<img src="./src/assets/logo-kendo.png" width="225" />](https://www.telerik.com/kendo-angular-ui/) [![Angular Logo](./src/assets/logo-angular.png)](https://angular.io/)

## What this fork is about

Demonstrate if nix together with the Angular + Kendo framework is working as expected.

Checkout the original repo [here](https://github.com/telerik/kendo-angular/tree/master/examples-standalone/coffee-warehouse)

## Development

### Prerequisites

- install `nix the package manager` -> read [here](https://nixos.org/download.html)
- cd to project root

```sh
nix-shell
```

This project provides a `nix-shell` that will create an environment where all required tools are installed.

Usage of `direnv` to automatically enter the shell is recommended.

inside the devShell you can run `npm install` and `node` as usual. Without interference of your local system.

## Pre-commit

`nix/pre-commit.nix` specifies some pre-commit checks to be performed on staged code.

JS/TS Tools:

- eslint
- prettier
- more could be added like `tsc --noEmit` for typechecking.

nix related tools:

- nixpkgs-fmt # for formatting nix files
- statix # for linting the nix syntax

## Build

Run `nix-build` to build all attributes. The build runs totally isolated and reproducible just like in any pipeline. (Also Locally on the developer machine).

currently the only attribute is `staticSite`

> Note: you might also want to change the `ng` overlay from `./nix/overlay.nix` to fit your needs.

## Adding new dependencies

After adding new dependencies it is required to update some nix files. `package.json` exposes a script for the required update. (node2nix)

run `npm run update:nix`

to update the `node2nix` files.

## Roadmap on the build system

This project utilizes `node2nix` which is well tested and stable in the nix ecosystem. But there is currently (dream2nix)[https://github.com/nix-community/dream2nix] under construction which will replace node2nix in the future but as soon as possible.

dream2nix does unfortunately not yet work with this project (latest tests on 14.10.2022)
