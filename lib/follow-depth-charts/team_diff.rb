module FollowDepthCharts
  module TeamDiff
    def self.diff(old, new)
      if old.name != new.name
        return nil
      else
        get_diff(old, new)
      end
    end

    def self.get_diff(old, new)
      diff = {}
      diff[:closer] = { old: old.closer,
                        new: new.closer } if old.closer != new.closer
      diff[:next] = { old: old.next,
                      new: new.next } if old.next != new.next
      diff[:stealth] = { old: old.stealth,
                         new: new.stealth } if old.stealth != new.stealth
      diff[:looming] = { old: old.looming,
                         new: new.looming } if old.looming != new.looming
      diff
    end
  end
end
