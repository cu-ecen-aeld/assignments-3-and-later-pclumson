#!/bin/sh
# Script outline to install and build kernel.
# Author: Siddhant Jajoo.

set -e
set -u

OUTDIR=/tmp/aeld
KERNEL_REPO=git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
KERNEL_VERSION=v5.1.10
BUSYBOX_VERSION=1_33_1
FINDER_APP_DIR=$(realpath $(dirname $0))
ARCH=arm64
CROSS_COMPILE=aarch64-none-linux-gnu-

if [ $# -lt 1 ]
then
	echo "Using default directory ${OUTDIR} for output"
else
	OUTDIR=$1
	echo "Using passed directory ${OUTDIR} for output"
fi

mkdir -p ${OUTDIR}

cd "$OUTDIR"
if [ ! -d "${OUTDIR}/linux-stable" ]; then
    #Clone only if the repository does not exist.
	echo "CLONING GIT LINUX STABLE VERSION ${KERNEL_VERSION} IN ${OUTDIR}"
	git clone ${KERNEL_REPO} --depth 1 --single-branch --branch ${KERNEL_VERSION}
fi
if [ ! -e ${OUTDIR}/linux-stable/arch/${ARCH}/boot/Image ]; then
    cd linux-stable
    echo "Checking out version ${KERNEL_VERSION}"
    git checkout ${KERNEL_VERSION}

    # TODO: Add your kernel build steps here
<<<<<<< HEAD
        echo "mrproper started"
        make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} mrproper
        echo "Started defconfig"
        make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} defconfig
        echo "mrproper started"
        make -j4 ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} all
        echo "Build started"
        make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} modules
        echo "Module compiled"
        make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} dtbs
        echo "Device tree  build"
        cp "${OUTDIR}/linux-stable/arch/${ARCH}/boot/Image" ${OUTDIR}

fi

echo "Adding the Image in outdir"
cd "$OUTDIR/linux-stable"
cp arch/arm64/boot/Image $OUTDIR/
=======
fi

echo "Adding the Image in outdir"
>>>>>>> assignments-base/assignment5

echo "Creating the staging directory for the root filesystem"
cd "$OUTDIR"
if [ -d "${OUTDIR}/rootfs" ]
then
	echo "Deleting rootfs directory at ${OUTDIR}/rootfs and starting over"
    sudo rm  -rf ${OUTDIR}/rootfs
fi

# TODO: Create necessary base directories
<<<<<<< HEAD
mkdir "$OUTDIR/rootfs"
cd "$OUTDIR/rootfs"
mkdir -p bin dev etc home lib lib64 proc sbin sys tmp usr var
mkdir -p usr/bin usr/lib usr/sbin
mkdir -p var/log

=======
>>>>>>> assignments-base/assignment5

cd "$OUTDIR"
if [ ! -d "${OUTDIR}/busybox" ]
then
git clone git://busybox.net/busybox.git
    cd busybox
    git checkout ${BUSYBOX_VERSION}
    # TODO:  Configure busybox
else
    cd busybox
fi

# TODO: Make and install busybox
<<<<<<< HEAD
make distclean
make defconfig
make -j4 ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE}
make CONFIG_PREFIX=${OUTDIR}/rootfs CROSS_COMPILE=${CROSS_COMPILE} install
=======
>>>>>>> assignments-base/assignment5

echo "Library dependencies"
${CROSS_COMPILE}readelf -a bin/busybox | grep "program interpreter"
${CROSS_COMPILE}readelf -a bin/busybox | grep "Shared library"

# TODO: Add library dependencies to rootfs
<<<<<<< HEAD
cd "$OUTDIR"
CROSS_COMPILE_GCC=$(which ${CROSS_COMPILE}gcc)
CROSS_COMPILE_GCCPATH=$(dirname ${CROSS_COMPILER_GCC})
cp ${CROSS_COMPILE_GCCPATH}/../aarch64-none-linux-gnu/libc/lib/ld-linux-aarch64.so.1 lib/
cp ${CROSS_COMPILE_GCCPATH}/../aarch64-none-linux-gnu/libc/lib64/libm.so.6 lib64/
cp ${CROSS_COMPILE_GCCPATH}/../aarch64-none-linux-gnu/libc/lib64/libresol.so.2 lib64/
cp ${CROSS_COMPILE_GCCPATH}/../aarch64-none-linux-gnu/libc/lib64/libm.so.6 lib64/


# TODO: Make device nodes
cd "$OUTDIR/rootfs"
sudo mknod -m 666 dev/null c 1 3 
sudo mknod -m 600 dev/console c 5 1

# TODO: Clean and build the writer utility
cd "${FINDER_APP_DIR}"
make clean 
make CROSS_COMPILE=${CROSS_COMPILE}

# TODO: Copy the finder related scripts and executables to the /home directory
# on the target rootfs
cd "OUTDIR/rootfs"
cp "${FINDER_APP_DIR}/autorun-quemu.sh" home/ 
cp "${FINDER_APP_DIR}/finder-test.sh" home/ 
cp "${FINDER_APP_DIR}/writer.sh" home/ 
cp -r "${FINDER_APP_DIR}/../conf" .
cp -r "${FINDER_APP_DIR}/conf" home/ 
cp "${FINDER_APP_DIR}/finder.sh" home/ 

# TODO: Chown the root directory
cd "$OUTDIR/rootfs"
sudo chown -R root:root * 

# TODO: Create initramfs.cpio.gz
cd "$OUTDIR/rootfs"
find . | cpio -H newc -ov --owner root:root > ${OUTDIR}/initramfs.cpio
cd "$OUTDIR"
gzip -f initramfs.cpio
=======

# TODO: Make device nodes

# TODO: Clean and build the writer utility

# TODO: Copy the finder related scripts and executables to the /home directory
# on the target rootfs

# TODO: Chown the root directory

# TODO: Create initramfs.cpio.gz
>>>>>>> assignments-base/assignment5
