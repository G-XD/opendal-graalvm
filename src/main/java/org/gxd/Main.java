package org.gxd;

import java.util.HashMap;
import java.util.Map;
import org.apache.opendal.Operator;

public class Main {
    public static void main(String[] args) {
        Map<String, String> map = new HashMap<>();
        map.put("root", "/tmp");
        try (Operator op = new Operator("fs", map)) {
            op.write("test.txt", "hello OpenDAL").join();
            System.out.println(op.read("test.txt").join());
            op.delete("test.txt").join();
        }
    }
}