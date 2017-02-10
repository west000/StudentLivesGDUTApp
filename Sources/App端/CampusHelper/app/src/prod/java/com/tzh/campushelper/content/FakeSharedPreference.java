package com.tzh.campushelper.content;

import android.content.SharedPreferences;
import android.support.annotation.Nullable;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@SuppressWarnings("unchecked")
public class FakeSharedPreference implements SharedPreferences {
    private Map<String, Object> mStore = new HashMap<>();

    @Override
    public Map<String, ?> getAll() {
        return mStore;
    }

    @Nullable
    @Override
    public String getString(String s, String s1) {
        return s1;
    }

    @Nullable
    @Override
    public Set<String> getStringSet(String s, Set<String> set) {
        Object o = mStore.get(s);
        return o == null ? set : (Set<String>) o;
    }

    @Override
    public int getInt(String s, int i) {
        Object o = mStore.get(s);
        return o == null ? i : (int) o;
    }

    @Override
    public long getLong(String s, long l) {
        Object o = mStore.get(s);
        return o == null ? l : (long) o;
    }

    @Override
    public float getFloat(String s, float v) {
        Object o = mStore.get(s);
        return o == null ? v : (float) o;
    }

    @Override
    public boolean getBoolean(String s, boolean b) {
        Object o = mStore.get(s);
        return o == null ? b : (boolean) o;
    }

    @Override
    public boolean contains(String s) {
        return mStore.containsKey(s);
    }

    @Override
    public Editor edit() {
        return new Editor() {
            @Override
            public Editor putString(String s, String s1) {
                mStore.put(s, s1);
                return this;
            }

            @Override
            public Editor putStringSet(String s, Set<String> set) {
                mStore.put(s, set);
                return this;
            }

            @Override
            public Editor putInt(String s, int i) {
                return null;
            }

            @Override
            public Editor putLong(String s, long l) {
                mStore.put(s, l);
                return this;
            }

            @Override
            public Editor putFloat(String s, float v) {
                mStore.put(s, v);
                return this;
            }

            @Override
            public Editor putBoolean(String s, boolean b) {
                mStore.put(s, b);
                return this;
            }

            @Override
            public Editor remove(String s) {
                mStore.remove(s);
                return this;
            }

            @Override
            public Editor clear() {
                mStore.clear();
                return this;
            }

            @Override
            public boolean commit() {
                return true;
            }

            @Override
            public void apply() {
            }
        };
    }

    @Override
    public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener onSharedPreferenceChangeListener) {
    }

    @Override
    public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener onSharedPreferenceChangeListener) {
    }
}
