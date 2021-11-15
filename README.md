# 🔐 MulleObjCLockFoundation

#### 🔐 MulleObjCLockFoundation provides locking support

This framework builds on `mulle-thread` but is also dependend on posix
conditions.

#### Classes

Class               | Description
--------------------|-----------------------
`NSLock`            |
`NSCondition`       |
`NSConditionLock`   |
`NSRecursiveLock`   |


#### Protocols

Class               | Description
--------------------|-----------------------
`NSLocking`         |

### You are here

```
   .-------------------------------------------------------------------.
   | MulleFoundation                                                   |
   '-------------------------------------------------------------------'
   .----------------------------.
   | Calendar                   |
   '----------------------------'
   .----------------------------.
   | OS                         |
   '----------------------------'
           .--------------------..----------..-----..---------.
           | Plist              || Archiver || KVC || Unicode |
           '--------------------''----------''-----''---------'
           .--------------------------------------------------..-------.
           | Standard                                         || Math  |
           '--------------------------------------------------''-------'
   .======..-----------------------------..----------------------------.
   | Lock || Container                   || Value                      |
   '======''-----------------------------''----------------------------'
   .-------------------------------------------------------------------.
   | MulleObjC                                                         |
   '-------------------------------------------------------------------'
```

## Add

Use [mulle-sde](//github.com/mulle-sde) to add MulleObjCLockFoundation to your project:

``` console
mulle-sde dependency add --objc --github MulleFoundation MulleObjCLockFoundation
```

## Install

### mulle-sde

Use [mulle-sde](//github.com/mulle-sde) to build and install MulleObjCLockFoundation
and all its dependencies:

```
mulle-sde install --prefix /usr/local \
   https://github.com/MulleFoundation/MulleObjCLockFoundation/archive/latest.tar.gz
```

### Manual Installation


Install the requirements:

Requirements                                      | Description
--------------------------------------------------|-----------------------
[some-requirement](//github.com/some/requirement) | Some requirement

Install into `/usr/local`:

```
mkdir build 2> /dev/null
(
   cd build ;
   cmake -DCMAKE_INSTALL_PREFIX=/usr/local \
         -DCMAKE_PREFIX_PATH=/usr/local \
         -DCMAKE_BUILD_TYPE=Release .. ;
   make install
)
```

### Steal

Read [STEAL.md](//github.com/mulle-c11/dox/STEAL.md) on how to steal the
source code and incorporate it in your own projects.
