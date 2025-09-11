#   Ansible playbook for Incus server setup

Supported systems:

- Debian
  - 13 (Trixie)
  - 12 (Bookworm)
- Ubuntu
  - 24.04 LTS (Noble Numbat)

<!--
Currently, this playbook creates BTRFS on top of LVM.
So, you must install your server on LVM.
On Ubuntu,
this is the default,
and no extra step is needed.
But on Debian,
ensure root LV doesn't take up all space in VG—20GiB is sufficient for root.
Otherwise, you should shrink it while unmounted, _e.g._

```shell
lvresize --size 20GiB --resizefs /dev/debian-vg/root
```
-->

##  Preparation

1.  Install your SSH public key on target servers,
    and set up your SSH client config.

2.  Build your
    [Ansible inventory](https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html)
    inside `./inventory/` directory.

    These optional host/group variables are supported:

    -   `hostname`
    -   `incus_preseed_file`
    -   `timezone`
    -   `zram.max`
    -   `zram.limit`
    -   `zram.percent`

3.  Optionally, install Mitogen,

    ```shell
    curl -Lo- https://files.pythonhosted.org/packages/source/m/mitogen/mitogen-0.3.27.tar.gz \
    | tar -C ~ -xzvf - && rm -rf ~/.mitogen && mv -v ~/mitogen-* ~/.mitogen
    ```

##  First setup

1.  If you want to use Mitogen,
    export these environment variables,

    ```shell
    export DEFAULT_STRATEGY=mitogen_linear DEFAULT_STRATEGY_PLUGIN_PATH=~/.mitogen/ansible_mitogen/plugins/strategy
    ```

2.  Run `sudo` role, then enter sudo password when asked,

    ```shell
    ansible-playbook setup.yaml -vv -t sudo -K
    ```

3.  Run common roles,

    ```shell
    ansible-playbook setup.yaml -vv
    ```

4.  Optionally, run `zram` role,

    ```shell
    ansible-playbook setup.yaml -vv -t zram
    ```

5.  Run `incus` role,

    ```shell
    ansible-playbook setup.yaml -vv -t incus
    ```

