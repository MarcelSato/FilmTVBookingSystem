// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.gre.filmtv;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.gre.filmtv.ProgCoursePK;

privileged aspect ProgCoursePK_Roo_Json {
    
    public String ProgCoursePK.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static ProgCoursePK ProgCoursePK.fromJsonToProgCoursePK(String json) {
        return new JSONDeserializer<ProgCoursePK>().use(null, ProgCoursePK.class).deserialize(json);
    }
    
    public static String ProgCoursePK.toJsonArray(Collection<ProgCoursePK> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<ProgCoursePK> ProgCoursePK.fromJsonArrayToProgCoursePKs(String json) {
        return new JSONDeserializer<List<ProgCoursePK>>().use(null, ArrayList.class).use("values", ProgCoursePK.class).deserialize(json);
    }
    
}