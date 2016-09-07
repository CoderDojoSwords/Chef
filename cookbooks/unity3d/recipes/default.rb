#
# Cookbook Name:: unity3d
# Recipe:: default
#
# Copyright 2016, Andrey Zhereshchin
#
# All rights reserved - Do Not Redistribute
#

unless node[:unity3d][:is_installed] do
  remote_file 'UnityEditor' do
    path "#{Chef::Config['file_cache_path']}/#{node[:unity3d][:installer][:editor][:filename]}"
    source "#{node[:unity3d][:installer][:editor][:source]}"
  end

  remote_file 'StandardAssets' do
    path "#{Chef::Config['file_cache_path']}/#{node[:unity3d][:installer][:assets][:filename]}"
    source "#{node[:unity3d][:installer][:assets][:source]}"
  end

  remote_file 'SampleProject' do
    path "#{Chef::Config['file_cache_path']}/#{node[:unity3d][:installer][:sample][:filename]}"
    source "#{node[:unity3d][:installer][:sample][:source]}"
  end

  package 'UnityEditor' do
    source "#{Chef::Config['file_cache_path']}/#{node[:unity3d][:installer][:editor][:filename]}"
    options "/S"
    provider Chef::Provider::Package::Windows
  end

  package 'StandardAssets' do
    source "#{Chef::Config['file_cache_path']}/#{node[:unity3d][:installer][:assets][:filename]}"
    options "/S"
    provider Chef::Provider::Package::Windows
  end

  package 'SampleProject' do
    source "#{Chef::Config['file_cache_path']}/#{node[:unity3d][:installer][:sample][:filename]}"
    options "/S"
    provider Chef::Provider::Package::Windows
  end

  ruby_block 'setInstalledMarker' do
    block do
      node.set[:unity3d][:is_installed] = true
    end
  end
end
