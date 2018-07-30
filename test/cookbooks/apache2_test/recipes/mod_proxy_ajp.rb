#
# Cookbook:: apache2_test
# Recipe:: mod_ajp
#
# Copyright:: 2012, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe '::default'
include_recipe '::mod_proxy'
include_recipe '::mod_proxy_ajp'
include_recipe 'tomcat::default'

if platform?('debian', 'ubuntu')
  package 'tomcat6-examples'
else
  package 'tomcat6-webapps'
end

web_app 'java_env' do
  template 'java_env.conf.erb'
  ajp_host 'localhost'
  ajp_port 8009
end
