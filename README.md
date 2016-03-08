# stups-crate

[stups](https://stups.io/) appliance for the [Crate.IO](https://crate.io) database.

This [stups](https://stups.io/) appliance is used to create a docker image
that can be deployed to AWS using the senza definition in `stups-crate.yaml`.

In its current form it creates a 3 node cluster on `c3.2xlarge` instances
storing data on 2 instance storage ssd drives that are combined into 1 level 0 raid.

All nodes are master and data nodes.

It uses aws discovery to discover other nodes of the cluster.

Data is stored in the following paths:

```
path:
  conf: /crate/config
  data: /data/data
  logs: /data/logs
  blobs: /data/blobs
```

## Docker

It is important to have a stups-compliant docker image to include 
a current `scm-source.json` in the root folder.
Use `make` to build your docker image:

```sh
$ DOCKER_IMAGE=pierone.stups.example.org/team/stups-crate:0.54.6 make build
```

## Parameters

These are the parameters for calling `senza create` to deploy crate to AWS:

 - `DockerImage`
    The name and tag of the stups-crate docker image to use.
    You might deploy it somewhere else than we did.

 - `ApplicationId`
    The id of your application you configured in th yourturn frontend.

 - `MintBucket`
    The name of the mint bucket that contains the credentials for crate.

 - `ClusterName`
    The name of the cluster. Nodes with different cluster names will not 
    join each other although they see each other.

 - `HeapSize`
    The amount of heap to use for crate (half of the available RAM but < 32g
    are recommended). Default: 4g

 - `ScalyrAccountKey`
    Api key for scalyr logging account. 
    Defaults to the invalid key: `NOT USED` so scalyr will not be used.
