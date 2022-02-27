## PaSh: Light-touch Data-Parallel Shell Processing
> _A system for parallelizing POSIX shell scripts._

Quick Jump: [Running PaSh](#running-pash) | [Installation](#installation) | [Testing](#testing) | [Repo Structure](#repo-structure) | [Community & More](#community--more) | [Citing](#citing)

## Running PaSh

To parallelize, say, `./evaluation/intro/hello-world.sh` with parallelization width of `2`, from the top-level directory of the repository run:

```sh
./pa.sh ./evaluation/intro/hello-world.sh
``` 

Run `./pa.sh --help` to get more information about the available commands.
See [docs/tutorial](docs/tutorial/) for a longer tutorial.

## Installation

On Ubuntu, Fedora, Debian, or Arch, run `curl up.pash.ndr.md | sh` to setup PaSh.
Alternatively, you can clone the repo and run `./scripts/distro-deps.sh;
./scripts/setup-pash.sh`

You can also built the Docker container from scratch by running
```sh
git clone git@github.com:binpash/pash.git
cd pash/scripts
docker build -t "pash/18.04" .
# Then launch container:
docker run --name pash-play -it pash/18.04
```

More installation instructions in [the tutorial](./docs/tutorial.md#installation).
Remember to `export` `PASH_TOP` in your startup scripts!

## Testing

To execute the current tests before committing and pushing code, simply run:

```sh
./scripts/run_tests.sh
```

## Repo Structure

This repo hosts the core `pash` development. The structure is as follows:

* [annotations](./annotations/): DSL characterizing commands, parallelizability study, and associated annotations.
* [compiler](./compiler): Shell-Dataflow translations and associated parallelization transformations.
* [docs](./docs): Design documents, tutorials, installation instructions, etc.
* [evaluation](./evaluation): Shell pipelines and example [scripts](./evaluation/scripts) used for the evaluation.
* [runtime](./runtime): Runtime component — e.g., `eager`, `split`, and assocaited combiners.
* [scripts](./scripts): Scripts related to continuous integration, deployment, and testing.

## Community & More

Mailing Lists: 
* [pash-users](https://groups.google.com/g/pash-users): Join this mailing list for discussing all things `pash`
* [pash-commits](https://groups.google.com/g/pash-commits): Join this mailing list for commit notifications

Development/contributions:
* Contribution guide: [docs/contrib](docs/contrib)
* Continuous Integration Server: [ci.binpa.sh](http://ci.binpa.sh)

## Citing

If you used PaSh, consider citing the following paper:
```
@inproceedings{pash2021eurosys,
author = {Vasilakis, Nikos and Kallas, Konstantinos and Mamouras, Konstantinos and Benetopoulos, Achilles and Cvetkovi\'{c}, Lazar},
title = {PaSh: Light-Touch Data-Parallel Shell Processing},
year = {2021},
isbn = {9781450383349},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
url = {https://doi.org/10.1145/3447786.3456228},
doi = {10.1145/3447786.3456228},
pages = {49–66},
numpages = {18},
keywords = {POSIX, Unix, pipelines, automatic parallelization, source-to-source compiler, shell},
location = {Online Event, United Kingdom},
series = {EuroSys '21}
}
```
