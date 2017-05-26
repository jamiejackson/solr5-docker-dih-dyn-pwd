#!/bin/bash

# workaround dir
wa_dir=/opt/solr/server/workaround
cores_dir=/opt/solr/server/solr/mycores
# caveat: this assumes that the db data config this specific file name.
db_config_file_name=db-data-config.xml

find "${cores_dir}" -type f -name "${db_config_file_name}" -print0 | while read -d $'\0' db_config_file; do
  core_conf_dir=$(dirname $db_config_file);
  # create the generated configs at container start
  ${wa_dir}/generate_data_config_file.sh ${core_conf_dir}
  #nohup \
  pywatch "${wa_dir}/generate_data_config_file.sh ${core_conf_dir}" \
    "${core_conf_dir}/${db_config_file_name}" &
done