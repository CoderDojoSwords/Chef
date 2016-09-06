#
# Cookbook Name:: unity3d
# Recipe:: default
#
# Copyright 2016, Andrey Zhereshchin
#
# All rights reserved - Do Not Redistribute
#
remote_file 'UnityEditor' do
  path "#{Chef::Config['file_cache_path']}/#{node[:unity3d][:installer][:editor][:filename]}"
  source "#{[:unity3d][:installer][:editor][:source]}"
end

remote_file 'StandardAssets' do
  path "#{Chef::Config['file_cache_path']}/#{node[:unity3d][:installer][:assets][:filename]}"
  source "#{[:unity3d][:installer][:assets][:source]}"
end

remote_file 'SampleProject' do
  path "#{Chef::Config['file_cache_path']}/#{node[:unity3d][:installer][:sample][:filename]}"
  source "#{[:unity3d][:installer][:sample][:source]}"
end
