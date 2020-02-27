chameleon-ipa-deploy
====================

Build tooling for a custom `ironic python agent <https://git.openstack.org/cgit/openstack/ironic-python-agent>`_ that includes a Chameleon-specific `hardware manager <https://github.com/ChameleonCloud/chameleon-ipa-hardware-manager>`_.

Building the ramdisk/kernel images
----------------------------------

The simplest way to build these images is on a distribution `already supported by diskimage-builder <https://docs.openstack.org/diskimage-builder/latest/user_guide/supported_distros.html>`_ (currently, CentOS 7 is on that list, but not CentOS 8).

There are some binary dependencies necessary. To get and install the latest list of binary dependencies, you can use the `bindep` tox env and pipe the result to a package manager.

.. code-block:: shell

   # RHEL/CentOS:
   tox -e bindep | xargs yum install
   # Ubuntu:
   tox -e bindep | xargs apt-get install

To build the image, run `tox` without any args (this effectively runs with `-e builder`).

.. code-block:: shell
   
   tox


The initramfs and kernel images, if built successfully, will be placed in the repo root directory.

Docker build (experimental)
^^^^^^^^^^^^^^^^^^^^^^^^^^^

It should be possible to run `diskimage-builder` inside of a Docker container, allowing you to build DIB images from your laptop running Mac OS X or likewise. This repo contains a Dockerfile that should set up most of the dependencies:

.. code-block:: shell

   make docker

Once the Docker image is created, you can launch a container to build the image. The container must run in `--privileged` mode in order for many parts of DIB to function; it is probably possible to break down this "allow everything" flag into individual capabilities and mounts, but it's unclear to the author which ones are needed.

.. code-block:: shell

   docker run --rm --privileged -v ./out:/out chameleon/ipa-builder


If successful, the initramfs and kernel images should be outputted to the `./out` directory.
