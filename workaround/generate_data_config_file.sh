#!/bin/bash
set -x

core_conf_dir=$1

hash_pwd=`cat /opt/solr/server/workaround/pwd/hashpwd.txt`

source_file=${core_conf_dir}/db-data-config.xml
generated_file=${core_conf_dir}/db-data-config-generated.xml

sed -e 's,\${custom\.dataimporter\.datasource\.password},'"${hash_pwd}"',g' "${source_file}" > "${generated_file}"
