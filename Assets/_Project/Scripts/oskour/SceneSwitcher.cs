using UnityEngine;
using UnityEngine.SceneManagement;

namespace Leon
{
    public class SceneSwitcher : MonoBehaviour
    {
        public void ChangeScene(string sceneName) {
            SceneManager.LoadScene(sceneName);
        }
    }
}
