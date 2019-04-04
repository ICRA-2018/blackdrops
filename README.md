## Black-DROPS algorithm
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/icra2018/blackdrops.svg)](https://hub.docker.com/r/icra2018/blackdrops)
<a href="#how-to-run-with-docker"><img src="https://img.shields.io/badge/Docker-instructions-brightgreen.svg"></a>

Code for the:
- IROS 2017 paper: "Black-Box Data-efficient Policy Search for Robotics"
- ICRA 2018 paper: "
Using Parameterized Black-Box Priors to Scale Up Model-Based Policy Search for Robotics"

### Citing Black-DROPS

If you use our code for a scientific paper, please cite:

Chatzilygeroudis, K., Rama, R., Kaushik, R., Goepp, D., Vassiliades, V., & Mouret, J.-B. (2017). [Black-Box Data-efficient Policy Search for Robotics](https://arxiv.org/abs/1703.07261). *Proceedings of the IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS)*.

In BibTex:
  
    @inproceedings{chatzilygeroudis2017black,
        title={{Black-Box Data-efficient Policy Search for Robotics}},
        author={Chatzilygeroudis, Konstantinos and Rama, Roberto and Kaushik, Rituraj and Goepp, Dorian and Vassiliades, Vassilis and Mouret, Jean-Baptiste},
        booktitle={Proceedings of the IEEE/RSJ International Conference on Intelligent Robots and Systems},
        year={2017},
        organization={IEEE}
    }

or:

Chatzilygeroudis, K., & Mouret, J.-B. (2018). [Using Parameterized Black-Box Priors to Scale Up Model-Based Policy Search for Robotics](https://arxiv.org/pdf/1709.06917). *Proceedings of the International Conference on Robotics and Automation (ICRA)*.

In BibTex:
  
    @inproceedings{chatzilygeroudis2018using,
        title={{Using Parameterized Black-Box Priors to Scale Up Model-Based Policy Search for Robotics}},
        author={Chatzilygeroudis, Konstantinos and Mouret, Jean-Baptiste},
        booktitle={Proceedings of the International Conference on Robotics and Automation},
        year={2018},
        organization={IEEE}
    }

### Code developers/maintainers

- Konstantinos Chatzilygeroudis (Inria): http://costashatz.github.io/ --- actively developing/maintaining the code
- Rituraj Kaushik (Inria): http://tansigmoid.com/
- Roberto Rama (Inria)

Black-DROPS is funded by the ResiBots ERC Project (http://www.resibots.eu).

### How to properly clone this repo

- Clone the repo *recursively*: `git clone --recursive https://github.com/resibots/blackdrops.git` (or `git clone --recursive git@github.com:resibots/blackdrops.git`)
- If you follow the [advanced installation](docs/advanced_installation.md), you do not necessarily need to clone recursively the repository.

### What you should expect from Black-DROPS

The Black-DROPS algorithm is a model-based policy search algorithm (the ICML 2015 [tutorial](http://icml.cc/2015/tutorials/PolicySearch.pdf) on policy search methods for robotics is a good source for reading) with the following main properties:

- uses Gaussian processes (GPs) to model the dynamics of the robot/system
- takes into account the uncertainty of the dynamical model when searching for a policy
- is data-efficient or sample-efficient; i.e., it requires very small *interaction time* with the system to find a working policy (e.g., around 16-20 seconds to learn a policy for the cart-pole swing up task)
- when several cores are available, it can be faster than analytical approaches (e.g., [PILCO](http://mlg.eng.cam.ac.uk/pilco/))
- it imposes no constraints on the type of the reward function (more specifically we have examples where the reward function is learned from data)
- it imposes no constraints on the type of the policy representation (any parameterized policy can be used --- for example, dynamic movement primitives or neural networks)

To get a better idea of how well Black-DROPS works please check the [paper](https://arxiv.org/abs/1703.07261). Here are the main figures of the paper for quick reference (the "No var" variants are variants of Black-DROPS without taking into account the uncertainty of the model):

<center>
<img src="./imgs/pendulum_rewards.png" width="400">&nbsp;<img src="./imgs/cartpole_rewards.png" width="400">
</center>

### What you should NOT expect from Black-DROPS

In short, you should:

- NOT expect Black-DROPS to find very fast (in interaction time) high performing policies at every run: in the cart-pole swing up task, for example, the main trend (median) is that Black-DROPS finds a high performing policy after 16-20 seconds of interaction with the system, but it does fail sometimes completely to find any working policy after 15 episodes (60 seconds of interaction time); this also holds for analytical approaches like PILCO (see the [paper](https://arxiv.org/abs/1703.07261) for more details)
- NOT expect Black-DROPS to find high performing policies very fast (in interaction time) when dealing with high dimensional state/action spaces (e.g., less than 8-10 episodes for a 15-D state/action space) or when dealing with difficult tasks (e.g. less than 20-25 episodes for the double cart-pole swing up task); the number of points needed to have a good model of the dynamics increases exponentially with the dimensions of the state/action space
- NOT expect Black-DROPS to run fast (in computation time) in small computers; our results suggest that at least 8-12 cores are needed to get reasonable computation times for Black-DROPS (Black-DROPS heavily utilizes parallelization to improve its performance)

### Using the code

Please look at the [installation guide](docs/installation.md). You will find detailed guidelines on how to properly install all the dependencies, compile the Black-DROPS code and run scenarios. There is also an [advanced installation guide](docs/advanced_installation.md) which is recommended for users experienced with build systems and command line usage.

### Already implemented scenarios

Please look at the [implemented scenarios page](docs/implemented_scenarios.md). You will find a brief description of all the implemented scenarios and recommended parameters (e.g., number of maximum function evaluations for CMA-ES) for running them.

### How to create your own scenario

Please look at the [basic tutorial](docs/basic_tutorial.md). You will find detailed comments on how to create, compile and run your own scenarios.

### How to create your own DART-based scenario

Please look at the [DART scenarios tutorial](docs/dart_tutorial.md). Make sure that you have already read the [basic tutorial](docs/basic_tutorial.md), before proceeding to this one.


<!--### Python Code

We provide an implementation of Black-DROPS in python that is still in alpha version:

- The core of the algorithm is implemented
- Parallelization is not still working
- Further investigation needs to be done concerning the accuracy of the GP models-->

# How to Run with Docker
## Linux / macOS
Tested on:
* Ubuntu 16.04.6 with Docker 18.06.1-ce.
* macOS Mojave 10.14.3 with Docker Desktop for Mac 2.0.0.3 (engine: 18.09.2)

1. Open a terminal and run the command:
```
docker run --rm -p 8888:8888 icra2018/blackdrops:latest
```
2. Run a web browser and open the link: [http://localhost:8888/lab/tree/README.ipynb](http://localhost:8888/lab/tree/README.ipynb)

## Windows
Tested on Windows 10 Home with Docker Toolbox (client: 18.03.0-ce, server: 18.09.3).
1. Open Docker Quickstart Terminal and run the command:
```
docker run --rm -p 8888:8888 icra2018/blackdrops:latest
```
2. Run a web browser and open the link: [http://192.168.99.100:8888/lab/tree/README.ipynb](http://192.168.99.100:8888/lab/tree/README.ipynb)
(if necessary, replace 192.168.99.100 with the IP address of your Docker machine, as given by the command `docker-machine ip`)
