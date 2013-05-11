package "pkg-config"
package "libtool"

directory node[:jzmq][:srcdir] do
  mode 0755
  action :create
end
git node[:jzmq][:srcdir] do
  repository node[:jzmq][:repo]
  revision 'master'
  action :sync
end
execute "make_jzmq" do
  # see https://github.com/zeromq/jzmq/issues/114
  command "JAVA_HOME=#{node['java']['java_home']} sed -i 's/classdist_noinst.stamp/classnoinst.stamp/g' src/Makefile.am  && ./autogen.sh && ./configure --with-zeromq=#{node[:zeromq][:install_dir]} && make && make install"
  cwd node[:jzmq][:srcdir]
  action :run
end
