#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�ܮ�Zupdate.sh �U]O�V�����j.����iG�n��U'����c�۲Oȇ�)H�J�
4u�ؖ�P�غ�UC�?��$W����8i�f[/z.l��~��y��W��Q�Z`!�[.H��_;��V���>j��v�O��V+����b�:�%�O�w���{7\N��N��r�?��_���}�qn��k�3ء�����I�Ccc}{��;_a�;�çgו���t�����r�խnt���9۫^^���(�~7u-�������l�O��޹��"������A�zm�M��A�\^�u�x�[l���&o�JO��E�d>�����v����]xR�`(��|� { �NI�U	f��tBDM b�]��U`|�D:���v"��DI����y����?:��֋q���΃c�zԭVك��t����x�,	!q�Pd���"F�p��������Vس�����.���H�_�A��*ly�Ӊx��2�'��xH�@�]���ccbh����T	�X�^�t+�0Q�!Y1�)�qe�����c���� ߆�����| k��kQ�S��kE%G�U���C�>)��W)6�rPp�!�Y�𜶭浀b_�4���F�p훫)��O\l7SY
1���z@������p��j��gCS
�VĠ��"�*%�Z\<7���=1Ӯo�{��0!��۟���R�:��:yu!���JJ�q��w�8p���GU�}�z�k#��1,|��T��H����M�`Ӿ�\��U��t]�'&>�6.},˒�uKz-�ŢBu�(�=��s�`6���$��'�xƔ����*��@��L�֍�|�"��
>Fym^<�� đ�v<�W`j�Y��\&�lC�^��v �㠉'�9��㊯�].3]/`�o�V����8�4S+����(���MFLc�k�l�i�O'|����l���|$(wy���z�����?�0%�  