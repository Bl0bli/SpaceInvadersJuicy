using Leon;
using UnityEditor;
using UnityEditor.UIElements;
using UnityEngine;

[CustomPropertyDrawer(typeof(WeightedPill))]
public class WeightedPillPropertyDrawer : PropertyDrawer
{
    public override void OnGUI(Rect position, SerializedProperty property, GUIContent label) {
        EditorGUI.BeginProperty(position, label, property);

        float halfWidth = position.width / 2f;
        var pillRect = new Rect(position.x, position.y, halfWidth - 3f, position.height);
        var weightRect = new Rect(position.x + halfWidth + 6, position.y, halfWidth - 3f, position.height);
        
        EditorGUI.PropertyField(pillRect, property.FindPropertyRelative("pill"), GUIContent.none);
        EditorGUI.PropertyField(weightRect, property.FindPropertyRelative("weight"), GUIContent.none);
        
        EditorGUI.EndProperty();
    }
    
    public override float GetPropertyHeight(SerializedProperty property, GUIContent label)
    {
        return EditorGUI.GetPropertyHeight(property, true);
    }
}
