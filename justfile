set shell := ["nu", "-c"]

default:
  @just --list\

build input:
  nix build .#{{input}}
