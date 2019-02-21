Puppet::Type.type(:yumrepo).provide(:yum_target, :parent => :inifile, :source => :inifile) do
  def create
    if @resource[:target] != :absent
      path = @resource[:target]
      self.class.virtual_inifile.read(path) if Puppet::FileSystem.file?(path)
      self.class.virtual_inifile.add_section(name, path) if ! self.class.virtual_inifile[name]
    end
    super
  end
end
