storm_name = "storm-#{node[:storm][:release_version]}"
install_dir = "#{node[:storm][:install_root]}/#{storm_name}"

runit_service "nimbus" do
  template_name "storm"
  options :daemon => "nimbus"
  options :install_dir => install_dir
end
announce(:storm, :nimbus)
